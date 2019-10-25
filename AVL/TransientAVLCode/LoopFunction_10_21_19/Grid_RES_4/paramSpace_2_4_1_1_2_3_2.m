function [aeroForces] = paramSpace_2_4_1_1_2_3_2(sailStates,airStates)

	CL = (6.090208)*sailStates.alpha + (-0.417274)*sailStates.beta + (-2.488792)*sailStates.p + (32.068348)*sailStates.q + (1.878208)*sailStates.r + (0.010297)*sailStates.de;
	CD = -2.145950;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.952663)*sailStates.p + (-0.000000)*sailStates.q + (0.062441)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.710468)*sailStates.alpha + (-0.595716)*sailStates.beta + (-1.131479)*sailStates.p + (8.406885)*sailStates.q + (1.819666)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-15.378508)*sailStates.alpha + (1.577478)*sailStates.beta + (9.178714)*sailStates.p + (-136.150452)*sailStates.q + (-6.334772)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.536461)*sailStates.alpha + (-0.026882)*sailStates.beta + (-2.220505)*sailStates.p + (10.424428)*sailStates.q + (-0.021587)*sailStates.r + (0.000204)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end