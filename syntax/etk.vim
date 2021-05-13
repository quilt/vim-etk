" File: etk.vim
" Author: lightclient
" Description: Runtime files for etk

if exists("b:current_syntax")
    finish
endif

" Comment contained keywords
syntax keyword etkTodos contained TODO XXX FIXME NOTE

" Comment patterns
syntax match etkComment ";.*$" contains=etkTodos

" Single-line string 
syntax region etkString start=/"/ skip=/\\\\\|\\"/ end=/"/ oneline

" Expression Macros
syntax keyword etkExpressionMacro selector contained

" Instruction Macros
syntax match etkInstructionMacro "%\(import\|include\|include_hex\|push\)\>"

" Labels
syntax match etkLabel "^\i*:$"

" Environment opcodes
syntax keyword etkEnvOpcode
	\ address 
	\ balance 
	\ origin
	\ caller
	\ callvalue
	\ calldataload
	\ calldatasize
	\ calldatacopy
	\ codesize
	\ codecopy
	\ gasprice
	\ returndatasize
	\ returndatacopy
	\ blockhash
	\ coinbase
	\ timestamp
	\ number
	\ difficulty
	\ gaslimit
	\ chainid
	\ selfbalance

" Trie opcodes
syntax keyword etkTrieOpcode
	\ extcodesize
	\ extcodecopy
	\ extcodehash
	\ sload
	\ sstore
	\ selfdestruct

" Call opcodes
syntax keyword etkCallOpcode
	\ create
	\ call
	\ callcode
	\ delegatecall
	\ create2
	\ staticcall

" Push opcodes
syntax match etkRegularOpcode
	\ "\<push\(3[1-2]\|[1-9]\|[1-2][0-9]\)\>"
	\ nextgroup=etkConstant,etkLabelConst,etkExpressionMacro
	\ skipwhite

" Push constants
" Label constant
syntax match etkLabelConst	"\<\i*\>"	contained
" Decimal constant
syntax match etkConstant	"\<\d*\>"	contained
" Hex constant
syntax match etkConstant	"\<0x\x*\>"	contained
" Binary constant
syntax match etkConstant	"\<0b[0-1]*\>"	contained
" Octal constant
syntax match etkConstant	"\<0o\o*\>"	contained

" Regular opcodes
syntax match etkRegularOpcode "\<swap\(1[0-6]\|[1-9]\)\>"
syntax match etkRegularOpcode "\<dup\(1[0-6]\|[1-9]\)\>"
syntax match etkRegularOpcode "\<log\([0-4]\)\>"

syntax keyword etkRegularOpcode
	\ stop
	\ add
	\ mul
	\ sub
	\ div
	\ sdiv
	\ mod
	\ smod
	\ addmod
	\ mulmod
	\ exp
	\ signextend
	\ lt
	\ gt
	\ slt
	\ sgt
	\ eq
	\ iszero
	\ and
	\ or
	\ xor
	\ not
	\ byte
	\ shl
	\ shr
	\ sar
	\ keccak256
	\ pop
	\ mload
	\ mstore
	\ mstore8
	\ jump
	\ jumpi
	\ pc
	\ msize
	\ gas
	\ jumpdest
	\ revert
	\ invalid
	\ return

" Set highlights
highlight link etkTodos Todo
highlight link etkComment Comment
highlight link etkKeyword Keyword
highlight link etkExpressionMacro Function
highlight link etkInstructionMacro Macro
highlight link etkString String

highlight link etkLabel Type
highlight link etkConstant Constant
highlight link etkLabelConst Type

highlight link etkEnvOpcode Special
highlight link etkTrieOpcode Special
highlight link etkCallOpcode Special
highlight link etkRegularOpcode Statement

let b:current_syntax = "etk"
