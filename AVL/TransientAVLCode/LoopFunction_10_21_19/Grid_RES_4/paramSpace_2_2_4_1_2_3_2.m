function [aeroForces] = paramSpace_2_2_4_1_2_3_2(sailStates,airStates)

	CL = (6.276833)*sailStates.alpha + (0.160615)*sailStates.beta + (-2.509043)*sailStates.p + (32.284927)*sailStates.q + (1.901582)*sailStates.r + (0.010551)*sailStates.de;
	CD = -2.243340;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.996833)*sailStates.p + (0.000003)*sailStates.q + (0.065336)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.839326)*sailStates.alpha + (-0.456407)*sailStates.beta + (-1.206207)*sailStates.p + (9.285314)*sailStates.q + (1.885251)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-15.814122)*sailStates.alpha + (-0.663654)*sailStates.beta + (9.255267)*sailStates.p + (-137.194580)*sailStates.q + (-6.477398)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.459510)*sailStates.alpha + (-0.033826)*sailStates.beta + (-2.290086)*sailStates.p + (10.510103)*sailStates.q + (-0.021731)*sailStates.r + (0.000176)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end