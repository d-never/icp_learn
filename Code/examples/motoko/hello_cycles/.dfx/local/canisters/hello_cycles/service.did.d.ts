import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface _SERVICE {
  'transfer' : ActorMethod<
    [[Principal, string], bigint],
    { 'refunded' : bigint }
  >,
  'wallet_balance' : ActorMethod<[], bigint>,
  'wallet_receive' : ActorMethod<[], { 'accepted' : bigint }>,
}
