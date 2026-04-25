# Bank-side DLT rail pattern

How an existing bank adds DLT as another rail alongside SCT Inst, SIC, CHAPS, SWIFT.

## Logical view

```mermaid
flowchart TB
    subgraph Channels
        Portal[Portal]
        API[API]
        SWIFT[SWIFT]
        H2H[H2H]
    end

    subgraph PaymentHub
        Ingest[Ingest]
        Orchestrator[Orchestrator]
        RailRouter[Rail Router]
    end

    subgraph TraditionalRails
        SEPAAdapter[SEPA Adapter]
        RTGSAdapter[RTGS Adapter]
        SWIFTAdapter[SWIFT Adapter]
    end

    subgraph DLTRail
        TokenSvc[Tokenization Service]
        ChainAdapter[Chain Adapter L1/L2/Permissioned]
        Custody[MPC / HSM Custody]
        Compliance[Compliance: Travel Rule + T-REX]
        Indexer[Indexer]
    end

    Portal --> Ingest
    API --> Ingest
    Ingest --> Orchestrator
    Orchestrator --> RailRouter
    RailRouter --> SEPAAdapter
    RailRouter --> RTGSAdapter
    RailRouter --> SWIFTAdapter
    RailRouter --> TokenSvc
    TokenSvc --> Custody
    TokenSvc --> Compliance
    TokenSvc --> ChainAdapter
    ChainAdapter --> Indexer
    Indexer --> Orchestrator
```

## Rail router decision

```python
def route_payment(payment):
    if payment.eligible_dlt() and payment.customer.dlt_enabled():
        return "DLT"
    if payment.amount > RTGS_THRESHOLD or payment.urgent:
        return "RTGS"  # T2 / SIC / CHAPS
    if payment.currency == "EUR" and payment.instant:
        return "SCT_INST"
    if payment.cross_border:
        return "SWIFT"
    return "SCT"  # batch SEPA
```

## DLT eligibility criteria

- Both customer + counterparty have DLT-enabled wallet
- Currency available as token (stablecoin, tokenized deposit, wholesale CBDC)
- Travel Rule data available for ≥ threshold
- Sanctions screening passes
- Cost (gas) reasonable

## Linked

[[../paycodex/architecture/sct-inst-logical]] · [[tokenization-platform-pattern]] · [[multi-chain-treasury-pattern]]
