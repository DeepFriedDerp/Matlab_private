function [aeroForces] = paramSpace_3_2_4_3_1_2_2(sailStates,airStates)

	CL = (4.060456)*sailStates.alpha + (0.040102)*sailStates.beta + (-2.561282)*sailStates.p + (35.021389)*sailStates.q + (0.476707)*sailStates.r + (0.010994)*sailStates.de;
	CD = 0.034220;
	CY = (-0.062618)*sailStates.alpha + (-0.025207)*sailStates.beta + (0.178599)*sailStates.p + (-0.498142)*sailStates.q + (-0.011759)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.309142)*sailStates.alpha + (-0.058631)*sailStates.beta + (-1.221059)*sailStates.p + (9.998384)*sailStates.q + (0.372007)*sailStates.r + (0.000376)*sailStates.de;
	Cm = (-14.615215)*sailStates.alpha + (-0.173832)*sailStates.beta + (8.694474)*sailStates.p + (-136.960373)*sailStates.q + (-1.640516)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (0.035787)*sailStates.alpha + (0.004696)*sailStates.beta + (-0.299285)*sailStates.p + (1.354901)*sailStates.q + (0.000283)*sailStates.r + (0.000150)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end