function val = apply_power_law(input, gamma)
    top = input .^ gamma;
    power = gamma - 1;
    bottom = 255 .^ power;
    val = round(top / bottom);
end