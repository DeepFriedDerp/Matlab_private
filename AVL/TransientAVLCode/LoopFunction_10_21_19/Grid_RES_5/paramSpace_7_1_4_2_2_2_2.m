function [aeroForces] = paramSpace_7_1_4_2_2_2_2(sailStates,airStates)

	CL = (4.148320)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.782261)*sailStates.p + (36.361832)*sailStates.q + (0.249381)*sailStates.r + (0.011159)*sailStates.de;
	CD = -0.076210;
	CY = (0.069181)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.165265)*sailStates.p + (0.438542)*sailStates.q + (0.005817)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (1.335575)*sailStates.alpha + (-0.100386)*sailStates.beta + (-1.385010)*sailStates.p + (11.319567)*sailStates.q + (0.316413)*sailStates.r + (0.000625)*sailStates.de;
	Cm = (-14.833593)*sailStates.alpha + (0.000000)*sailStates.beta + (9.578270)*sailStates.p + (-143.320496)*sailStates.q + (-0.887988)*sailStates.r + (-0.071014)*sailStates.de;
	Cn = (-0.016193)*sailStates.alpha + (-0.003506)*sailStates.beta + (-0.409603)*sailStates.p + (1.558380)*sailStates.q + (-0.001939)*sailStates.r + (-0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end