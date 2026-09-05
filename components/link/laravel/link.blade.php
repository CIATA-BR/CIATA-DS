@props([
    'href',
    'external' => false,
    'newWindow' => false,
    'download' => false,
    'downloadMeta' => null,
    'newContextLabel' => 'abre em novo contexto',
])

@php
    $href = trim((string) $href);
    $downloadMeta = $downloadMeta === null ? null : trim((string) $downloadMeta);
    $newContextLabel = trim((string) $newContextLabel);

    if ($href === '') {
        throw new InvalidArgumentException('href não pode ser vazio.');
    }
    if ($newWindow && $newContextLabel === '') {
        throw new InvalidArgumentException('newContextLabel não pode ser vazio quando newWindow estiver ativo.');
    }
@endphp

<a
    href="{{ $href }}"
    class="ciata-link {{ $attributes->get('class') }}"
    @if($newWindow) target="_blank" rel="noopener noreferrer" @endif
    @if($external && !$newWindow) rel="external" @endif
    @if($download) download @endif
    {{ $attributes->except(['class']) }}
>
    {{ $slot }}
    @if($downloadMeta)
        <span class="ciata-link__context">, {{ $downloadMeta }}</span>
    @endif
    @if($newWindow)
        <span class="ciata-link__context"> ({{ $newContextLabel }})</span>
    @endif
</a>
