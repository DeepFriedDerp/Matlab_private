function [aeroForces] = paramSpace_1_3_2_2_3_3_2(sailStates,airStates)

	CL = (4.077989)*sailStates.alpha + (-0.024195)*sailStates.beta + (-2.396768)*sailStates.p + (31.909000)*sailStates.q + (-0.050386)*sailStates.r + (0.009968)*sailStates.de;
	CD = -0.242400;
	CY = (0.090597)*sailStates.alpha + (-0.022918)*sailStates.beta + (0.152470)*sailStates.p + (0.759372)*sailStates.q + (0.026885)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.113249)*sailStates.alpha + (-0.104659)*sailStates.beta + (-1.090127)*sailStates.p + (8.479458)*sailStates.q + (0.194398)*sailStates.r + (0.000172)*sailStates.de;
	Cm = (-14.757447)*sailStates.alpha + (0.144575)*sailStates.beta + (8.623925)*sailStates.p + (-133.652283)*sailStates.q + (0.204792)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (0.168188)*sailStates.alpha + (-0.015706)*sailStates.beta + (-0.534000)*sailStates.p + (2.380171)*sailStates.q + (-0.025988)*sailStates.r + (-0.000167)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end