function [aeroForces] = paramSpace_3_3_1_3_2_1_2(sailStates,airStates)

	CL = (4.241420)*sailStates.alpha + (0.038407)*sailStates.beta + (-2.550003)*sailStates.p + (34.163258)*sailStates.q + (-0.332114)*sailStates.r + (0.010929)*sailStates.de;
	CD = -0.159350;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.255176)*sailStates.p + (0.000000)*sailStates.q + (0.016725)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.267988)*sailStates.alpha + (0.134880)*sailStates.beta + (-1.186511)*sailStates.p + (9.377357)*sailStates.q + (-0.418828)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-15.093846)*sailStates.alpha + (-0.183852)*sailStates.beta + (8.906568)*sailStates.p + (-137.194580)*sailStates.q + (1.157273)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.164369)*sailStates.alpha + (-0.007923)*sailStates.beta + (0.622624)*sailStates.p + (-2.917414)*sailStates.q + (-0.008570)*sailStates.r + (-0.000035)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end