function [aeroForces] = paramSpace_3_4_2_2_2_2_3(sailStates,airStates)

	CL = (3.926192)*sailStates.alpha + (-0.065545)*sailStates.beta + (-2.949468)*sailStates.p + (37.953217)*sailStates.q + (0.379118)*sailStates.r + (0.011088)*sailStates.de;
	CD = 0.029620;
	CY = (0.001464)*sailStates.alpha + (-0.024689)*sailStates.beta + (0.083870)*sailStates.p + (-0.100924)*sailStates.q + (-0.005494)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.292042)*sailStates.alpha + (-0.062714)*sailStates.beta + (-1.478619)*sailStates.p + (12.156333)*sailStates.q + (0.254815)*sailStates.r + (0.000739)*sailStates.de;
	Cm = (-14.222600)*sailStates.alpha + (0.206649)*sailStates.beta + (10.034443)*sailStates.p + (-147.195892)*sailStates.q + (-1.271434)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (-0.081894)*sailStates.alpha + (0.002836)*sailStates.beta + (-0.105094)*sailStates.p + (0.291267)*sailStates.q + (-0.003499)*sailStates.r + (0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end