function [aeroForces] = paramSpace_2_4_4_3_2_1_2(sailStates,airStates)

	CL = (4.234884)*sailStates.alpha + (0.188848)*sailStates.beta + (-2.564522)*sailStates.p + (35.459061)*sailStates.q + (-0.970398)*sailStates.r + (0.011075)*sailStates.de;
	CD = -0.174400;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.361079)*sailStates.p + (0.000001)*sailStates.q + (-0.023666)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.230901)*sailStates.alpha + (0.241497)*sailStates.beta + (-1.155560)*sailStates.p + (9.312877)*sailStates.q + (-0.798634)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.272907)*sailStates.alpha + (-0.643263)*sailStates.beta + (8.549959)*sailStates.p + (-136.150452)*sailStates.q + (3.258178)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.102828)*sailStates.alpha + (0.011131)*sailStates.beta + (0.763636)*sailStates.p + (-3.398340)*sailStates.q + (0.002419)*sailStates.r + (-0.000081)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end