function [aeroForces] = paramSpace_2_3_2_3_3_2_1(sailStates,airStates)

	CL = (4.055581)*sailStates.alpha + (0.031330)*sailStates.beta + (-2.301302)*sailStates.p + (32.896351)*sailStates.q + (-0.433649)*sailStates.r + (0.010902)*sailStates.de;
	CD = 0.023170;
	CY = (0.070913)*sailStates.alpha + (-0.024807)*sailStates.beta + (-0.153040)*sailStates.p + (0.432842)*sailStates.q + (-0.010046)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.115492)*sailStates.alpha + (0.067912)*sailStates.beta + (-0.975953)*sailStates.p + (7.621059)*sailStates.q + (-0.317883)*sailStates.r + (-0.000052)*sailStates.de;
	Cm = (-14.612250)*sailStates.alpha + (-0.122524)*sailStates.beta + (7.829125)*sailStates.p + (-129.813766)*sailStates.q + (1.474339)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (-0.107662)*sailStates.alpha + (0.003704)*sailStates.beta + (0.271527)*sailStates.p + (-1.352418)*sailStates.q + (0.001148)*sailStates.r + (-0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end