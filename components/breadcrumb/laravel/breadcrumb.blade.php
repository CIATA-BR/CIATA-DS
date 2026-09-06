@props([
    'items',
    'label' => 'Breadcrumb',
])

@php
    $label = trim((string) $label);
    $items = collect($items)->values();

    if ($label === '') {
        throw new InvalidArgumentException('label não pode ser vazio.');
    }
    if ($items->isEmpty()) {
        throw new InvalidArgumentException('items não pode ser vazio.');
    }

    $items = $items->map(function ($item, $index) use ($items) {
        if (! is_array($item) || ! array_key_exists('label', $item)) {
            throw new InvalidArgumentException('cada item deve informar label.');
        }

        $itemLabel = trim((string) $item['label']);
        if ($itemLabel === '') {
            throw new InvalidArgumentException('rótulos não podem ser vazios.');
        }

        $isCurrent = $index === $items->count() - 1;
        $href = array_key_exists('href', $item) ? trim((string) $item['href']) : '';
        if (! $isCurrent && $href === '') {
            throw new InvalidArgumentException('itens anteriores ao atual devem informar href.');
        }

        return [
            'label' => $itemLabel,
            'href' => $href,
        ];
    });
@endphp

<nav class="ciata-breadcrumb" aria-label="{{ $label }}">
    <ol class="ciata-breadcrumb__list">
        @foreach($items as $index => $item)
            @php($isCurrent = $index === count($items) - 1)
            <li class="ciata-breadcrumb__item">
                @if($isCurrent)
                    <span class="ciata-breadcrumb__current" aria-current="page">{{ $item['label'] }}</span>
                @else
                    <a class="ciata-breadcrumb__link" href="{{ $item['href'] }}">{{ $item['label'] }}</a>
                @endif
            </li>
        @endforeach
    </ol>
</nav>
