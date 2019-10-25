function [aeroForces] = paramSpace_2_2_3_2_1_1_1(sailStates,airStates)

	CL = (4.343669)*sailStates.alpha + (-0.086571)*sailStates.beta + (-2.198638)*sailStates.p + (32.867313)*sailStates.q + (-1.084806)*sailStates.r + (0.011112)*sailStates.de;
	CD = -0.355960;
	CY = (-0.043454)*sailStates.alpha + (-0.024697)*sailStates.beta + (-0.404308)*sailStates.p + (-0.870359)*sailStates.q + (-0.026530)*sailStates.r + (-0.000186)*sailStates.de;

	Cl = (1.040224)*sailStates.alpha + (0.213905)*sailStates.beta + (-0.909009)*sailStates.p + (7.244699)*sailStates.q + (-0.954839)*sailStates.r + (-0.000122)*sailStates.de;
	Cm = (-13.861417)*sailStates.alpha + (0.330189)*sailStates.beta + (7.279614)*sailStates.p + (-126.510948)*sailStates.q + (3.679841)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (-0.297728)*sailStates.alpha + (0.015622)*sailStates.beta + (0.893067)*sailStates.p + (-3.323240)*sailStates.q + (-0.000115)*sailStates.r + (0.000175)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end