function [aeroForces] = paramSpace_1_2_3_1_3_3_3(sailStates,airStates)

	CL = (4.969319)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.167589)*sailStates.p + (35.610260)*sailStates.q + (0.641516)*sailStates.r + (0.009877)*sailStates.de;
	CD = -1.550650;
	CY = (0.444811)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.496922)*sailStates.p + (2.260753)*sailStates.q + (0.087836)*sailStates.r + (0.000488)*sailStates.de;

	Cl = (1.301807)*sailStates.alpha + (-0.338660)*sailStates.beta + (-1.804666)*sailStates.p + (14.828795)*sailStates.q + (0.911563)*sailStates.r + (0.001388)*sailStates.de;
	Cm = (-14.527635)*sailStates.alpha + (0.000000)*sailStates.beta + (11.930320)*sailStates.p + (-157.393341)*sailStates.q + (-2.126285)*sailStates.r + (-0.070740)*sailStates.de;
	Cn = (-0.652929)*sailStates.alpha + (-0.059715)*sailStates.beta + (-1.475919)*sailStates.p + (6.031448)*sailStates.q + (-0.044052)*sailStates.r + (-0.000527)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end