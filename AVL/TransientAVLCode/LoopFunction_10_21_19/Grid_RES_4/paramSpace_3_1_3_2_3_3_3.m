function [aeroForces] = paramSpace_3_1_3_2_3_3_3(sailStates,airStates)

	CL = (4.248419)*sailStates.alpha + (0.294671)*sailStates.beta + (-2.983261)*sailStates.p + (39.134972)*sailStates.q + (1.196617)*sailStates.r + (0.011303)*sailStates.de;
	CD = -0.369400;
	CY = (0.160127)*sailStates.alpha + (-0.024002)*sailStates.beta + (0.451288)*sailStates.p + (0.668510)*sailStates.q + (-0.029555)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.397385)*sailStates.alpha + (-0.170104)*sailStates.beta + (-1.589332)*sailStates.p + (13.671046)*sailStates.q + (1.065360)*sailStates.r + (0.001017)*sailStates.de;
	Cm = (-13.472377)*sailStates.alpha + (-1.172073)*sailStates.beta + (9.895022)*sailStates.p + (-147.557632)*sailStates.q + (-4.075314)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (-0.357917)*sailStates.alpha + (0.016310)*sailStates.beta + (-0.936067)*sailStates.p + (3.360429)*sailStates.q + (-0.001726)*sailStates.r + (-0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end