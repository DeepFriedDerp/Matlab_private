function [aeroForces] = paramSpace_4_4_1_1_2_1_2(sailStates,airStates)

	CL = (5.769227)*sailStates.alpha + (0.348581)*sailStates.beta + (-2.292303)*sailStates.p + (27.009098)*sailStates.q + (-1.285607)*sailStates.r + (0.009045)*sailStates.de;
	CD = -2.045940;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.833556)*sailStates.p + (0.000002)*sailStates.q + (0.165805)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.547894)*sailStates.alpha + (0.499367)*sailStates.beta + (-1.053791)*sailStates.p + (7.139922)*sailStates.q + (-1.460693)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-16.799215)*sailStates.alpha + (-1.460104)*sailStates.beta + (9.596339)*sailStates.p + (-133.820877)*sailStates.q + (4.186916)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.643112)*sailStates.alpha + (-0.069663)*sailStates.beta + (2.065046)*sailStates.p + (-9.751282)*sailStates.q + (-0.078911)*sailStates.r + (-0.000156)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end