@props([
    'items',
    'label' => 'Breadcrumb',
])

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
