function [aeroForces] = paramSpace_1_1_1_1_2_2_1(sailStates,airStates)

	CL = (3.868429)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.794507)*sailStates.p + (25.891293)*sailStates.q + (0.084020)*sailStates.r + (0.008919)*sailStates.de;
	CD = -0.360040;
	CY = (0.005095)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.220717)*sailStates.p + (0.476204)*sailStates.q + (0.054979)*sailStates.r + (0.000099)*sailStates.de;

	Cl = (0.817972)*sailStates.alpha + (-0.129068)*sailStates.beta + (-0.681726)*sailStates.p + (4.660200)*sailStates.q + (0.338724)*sailStates.r + (-0.000383)*sailStates.de;
	Cm = (-14.359356)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.941192)*sailStates.p + (-118.206032)*sailStates.q + (-0.138579)*sailStates.r + (-0.064943)*sailStates.de;
	Cn = (0.446973)*sailStates.alpha + (-0.032180)*sailStates.beta + (-0.670468)*sailStates.p + (3.097846)*sailStates.q + (-0.040460)*sailStates.r + (-0.000064)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end