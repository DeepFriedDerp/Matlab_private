function [aeroForces] = paramSpace_2_3_2_2_1_3_1(sailStates,airStates)

	CL = (4.606248)*sailStates.alpha + (-0.063524)*sailStates.beta + (-2.145768)*sailStates.p + (30.468462)*sailStates.q + (0.925332)*sailStates.r + (0.010598)*sailStates.de;
	CD = -0.532080;
	CY = (-0.194369)*sailStates.alpha + (-0.025317)*sailStates.beta + (0.534512)*sailStates.p + (-0.870357)*sailStates.q + (0.035064)*sailStates.r + (-0.000186)*sailStates.de;

	Cl = (1.267842)*sailStates.alpha + (-0.252758)*sailStates.beta + (-0.859593)*sailStates.p + (6.203889)*sailStates.q + (0.912041)*sailStates.r + (-0.000209)*sailStates.de;
	Cm = (-15.357932)*sailStates.alpha + (0.241255)*sailStates.beta + (7.724940)*sailStates.p + (-126.510948)*sailStates.q + (-3.114517)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (0.725465)*sailStates.alpha + (-0.014157)*sailStates.beta + (-1.224257)*sailStates.p + (6.367969)*sailStates.q + (-0.016831)*sailStates.r + (0.000350)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end