function [aeroForces] = paramSpace_3_1_2_2_2_1_2(sailStates,airStates)

	CL = (4.421384)*sailStates.alpha + (-0.176840)*sailStates.beta + (-2.520916)*sailStates.p + (33.486984)*sailStates.q + (-0.682475)*sailStates.r + (0.010647)*sailStates.de;
	CD = -0.421370;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.409238)*sailStates.p + (0.000000)*sailStates.q + (0.026823)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.415152)*sailStates.alpha + (0.158657)*sailStates.beta + (-1.239425)*sailStates.p + (9.997172)*sailStates.q + (-0.725935)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.961804)*sailStates.alpha + (0.740476)*sailStates.beta + (8.915827)*sailStates.p + (-136.150452)*sailStates.q + (2.323900)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.206888)*sailStates.alpha + (-0.015205)*sailStates.beta + (0.983876)*sailStates.p + (-4.679567)*sailStates.q + (-0.011628)*sailStates.r + (-0.000077)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end