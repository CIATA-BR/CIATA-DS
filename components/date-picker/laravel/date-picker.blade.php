@props([
    'id',
    'label',
    'name',
    'value' => null,
    'min' => null,
    'max' => null,
    'required' => false,
    'disabled' => false,
    'readonly' => false,
    'helperText' => null,
    'errorText' => null,
])

@php
    $id = trim((string) $id);
    $label = trim((string) $label);
    $name = trim((string) $name);
    $value = $value !== null ? trim((string) $value) : null;
    $min = $min !== null ? trim((string) $min) : null;
    $max = $max !== null ? trim((string) $max) : null;
    $helperText = $helperText !== null ? trim((string) $helperText) : null;
    $errorText = $errorText !== null ? trim((string) $errorText) : null;

    if ($id === '' || $label === '' || $name === '') {
        throw new InvalidArgumentException('id, label e name não podem ser vazios.');
    }

    $parseDate = static function (?string $date, string $field): ?DateTimeImmutable {
        if ($date === null || $date === '') {
            return null;
        }

        $parsed = DateTimeImmutable::createFromFormat('!Y-m-d', $date);
        $errors = DateTimeImmutable::getLastErrors();
        if ($parsed === false || ($errors !== false && ($errors['warning_count'] > 0 || $errors['error_count'] > 0)) || $parsed->format('Y-m-d') !== $date) {
            throw new InvalidArgumentException("{$field} deve usar o formato YYYY-MM-DD e representar uma data válida.");
        }

        return $parsed;
    };

    $valueDate = $parseDate($value, 'value');
    $minDate = $parseDate($min, 'min');
    $maxDate = $parseDate($max, 'max');

    if ($minDate && $maxDate && $minDate > $maxDate) {
        throw new InvalidArgumentException('min deve ser anterior ou igual a max.');
    }
    if ($valueDate && (($minDate && $valueDate < $minDate) || ($maxDate && $valueDate > $maxDate))) {
        throw new InvalidArgumentException('value deve estar dentro do intervalo permitido.');
    }
@endphp

<div class="ciata-date-picker">
    <label for="{{ $id }}">{{ $label }}</label>
    <input
        id="{{ $id }}"
        name="{{ $name }}"
        type="date"
        value="{{ $value }}"
        @if($min) min="{{ $min }}" @endif
        @if($max) max="{{ $max }}" @endif
        @required($required)
        @disabled($disabled)
        @readonly($readonly)
        @if($helperText || $errorText) aria-describedby="{{ $id }}-description" @endif
        @if($errorText) aria-invalid="true" @endif
    >
    @if($helperText || $errorText)
        <div id="{{ $id }}-description" class="ciata-date-picker__description">
            {{ $errorText ?: $helperText }}
        </div>
    @endif
</div>
