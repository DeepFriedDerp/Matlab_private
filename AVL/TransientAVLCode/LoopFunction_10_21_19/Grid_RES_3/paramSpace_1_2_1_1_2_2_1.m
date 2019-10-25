function [aeroForces] = paramSpace_1_2_1_1_2_2_1(sailStates,airStates)

	CL = (3.587083)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.642373)*sailStates.p + (28.057491)*sailStates.q + (-0.584210)*sailStates.r + (0.010260)*sailStates.de;
	CD = 0.067950;
	CY = (-0.027170)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.123435)*sailStates.p + (-0.589407)*sailStates.q + (-0.021709)*sailStates.r + (-0.000124)*sailStates.de;

	Cl = (0.579766)*sailStates.alpha + (0.085224)*sailStates.beta + (-0.469412)*sailStates.p + (3.160922)*sailStates.q + (-0.384613)*sailStates.r + (-0.000783)*sailStates.de;
	Cm = (-12.811368)*sailStates.alpha + (-0.000000)*sailStates.beta + (5.507519)*sailStates.p + (-111.551048)*sailStates.q + (2.000311)*sailStates.r + (-0.066175)*sailStates.de;
	Cn = (-0.131999)*sailStates.alpha + (0.015027)*sailStates.beta + (0.231430)*sailStates.p + (-0.469388)*sailStates.q + (-0.012704)*sailStates.r + (0.000166)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end