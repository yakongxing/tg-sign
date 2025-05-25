FROM python:3.12-slim AS builder

RUN apt-get update && apt-get install -y gcc && \
    mkdir -p build && \
    pip wheel -w build tgcrypto

FROM python:3.12-slim
COPY --from=builder /build/*.whl /tmp/

RUN pip install /tmp/*.whl && \
    pip install -U "tg-signer[tgcrypto]"

COPY . /opt/tg-signer
WORKDIR /opt/tg-signer

RUN tg-signer import -I emby_feiniu.config mytask
    
ENTRYPOINT ["sh", "./entrypoint.sh"]
