@props([
    'message',
    'variant' => 'neutral',
    'dismissible' => false,
])

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
