@props([
    'message',
    'variant' => 'neutral',
    'dismissible' => false,
])

@php
    $message = trim((string) $message);
    $variant = trim((string) $variant);
    $dismissible = (bool) $dismissible;
    $allowedVariants = ['neutral', 'success', 'warning', 'error'];

    if ($message === '') {
        throw new InvalidArgumentException('message não pode ser vazio.');
    }
    if (! in_array($variant, $allowedVariants, true)) {
        throw new InvalidArgumentException('variant deve ser neutral, success, warning ou error.');
    }
@endphp

<div
    class="ciata-toast ciata-toast--{{ $variant }}"
    role="status"
    aria-live="polite"
    aria-atomic="true"
    {{ $attributes }}
>
    <span class="ciata-toast__message">{{ $message }}</span>

    @isset($action)
        <span class="ciata-toast__action">{{ $action }}</span>
    @endisset

    @if($dismissible)
        @isset($dismiss)
            <span class="ciata-toast__dismiss">{{ $dismiss }}</span>
        @endisset
    @endif
</div>
