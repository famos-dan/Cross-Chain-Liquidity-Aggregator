;; title: Cross-Chain-Liquidity-Aggregator

;; Constants
(define-constant CONTRACT-OWNER tx-sender)
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-INSUFFICIENT-BALANCE (err u101))
(define-constant ERR-INVALID-AMOUNT (err u102))
(define-constant ERR-POOL-NOT-FOUND (err u103))
(define-constant ERR-SLIPPAGE-TOO-HIGH (err u104))
(define-constant ERR-DEADLINE-PASSED (err u105))
(define-constant ERR-INVALID-POOL-ID (err u106))
(define-constant ERR-INVALID-ROUTE (err u107))
(define-constant ERR-YIELD-STRATEGY-NOT-FOUND (err u108))
(define-constant ERR-INVALID-TOKEN (err u109))
(define-constant ERR-INSUFFICIENT-LIQUIDITY (err u110))
(define-constant ERR-PROTOCOL-PAUSED (err u111))
(define-constant ERR-INVALID-FEE-BPS (err u112))
(define-constant ERR-INVALID-REFERRAL (err u113))
(define-constant ERR-MAX-CAPACITY-REACHED (err u114))

;; Data variables
(define-data-var protocol-paused bool false)
(define-data-var protocol-fee-bps uint u20) ;; 0.2% default fee
(define-data-var treasury-address principal CONTRACT-OWNER)
(define-data-var referral-fee-bps uint u5) ;; 0.05% referral fee
(define-data-var protocol-fees-accumulated uint u0)

;; Data maps
(define-map liquidity-pools
  { pool-id: uint }
  {
    name: (string-ascii 32),
    token-a: principal,
    token-b: principal,
    reserve-a: uint,
    reserve-b: uint,
    liquidity-tokens: uint,
    fee-bps: uint,
    last-rebalance-time: uint,
    is-active: bool,
    max-capacity: uint,
    total-volume: uint,
    yield-strategy-id: (optional uint)
  }
)
