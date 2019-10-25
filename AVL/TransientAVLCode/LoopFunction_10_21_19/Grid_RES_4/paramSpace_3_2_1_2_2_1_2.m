function [aeroForces] = paramSpace_3_2_1_2_2_1_2(sailStates,airStates)

	CL = (4.502368)*sailStates.alpha + (-0.066175)*sailStates.beta + (-2.540696)*sailStates.p + (33.736469)*sailStates.q + (-0.688722)*sailStates.r + (0.010843)*sailStates.de;
	CD = -0.431330;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.423692)*sailStates.p + (0.000000)*sailStates.q + (0.027770)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.384097)*sailStates.alpha + (0.196556)*sailStates.beta + (-1.216218)*sailStates.p + (9.668550)*sailStates.q + (-0.750402)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-15.257504)*sailStates.alpha + (0.292871)*sailStates.beta + (8.985798)*sailStates.p + (-137.194580)*sailStates.q + (2.366092)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.221893)*sailStates.alpha + (-0.014481)*sailStates.beta + (1.003152)*sailStates.p + (-4.663053)*sailStates.q + (-0.011667)*sailStates.r + (-0.000067)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end