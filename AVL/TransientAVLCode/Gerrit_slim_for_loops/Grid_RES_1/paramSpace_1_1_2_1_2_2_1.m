function [aeroForces] = paramSpace_1_1_2_1_2_2_1(sailStates,airStates)

	CL = (7.506500)*sailStates.alpha + (0.417394)*sailStates.beta + (-2.541954)*sailStates.p + (29.951183)*sailStates.q + (0.000023)*sailStates.r + (0.008769)*sailStates.de;
	CD = -4.090210;
	CY = (1.887839)*sailStates.alpha + (-0.054406)*sailStates.beta + (-0.405297)*sailStates.p + (15.432343)*sailStates.q + (-0.052265)*sailStates.r + (0.003284)*sailStates.de;

	Cl = (-0.939080)*sailStates.alpha + (-0.418074)*sailStates.beta + (-1.433801)*sailStates.p + (12.326159)*sailStates.q + (0.637344)*sailStates.r + (0.000536)*sailStates.de;
	Cm = (-14.292332)*sailStates.alpha + (-2.005896)*sailStates.beta + (8.981168)*sailStates.p + (-136.813812)*sailStates.q + (-0.211223)*sailStates.r + (-0.068272)*sailStates.de;
	Cn = (-1.986545)*sailStates.alpha + (-0.031221)*sailStates.beta + (0.273001)*sailStates.p + (-12.086169)*sailStates.q + (0.142811)*sailStates.r + (-0.004379)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end