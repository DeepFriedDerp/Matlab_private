function [aeroForces] = paramSpace_1_2_2_3_1_3_2(sailStates,airStates)

	CL = (4.062984)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.471064)*sailStates.p + (33.097019)*sailStates.q + (-0.094882)*sailStates.r + (0.010340)*sailStates.de;
	CD = -0.125460;
	CY = (-0.058760)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.184424)*sailStates.p + (-0.491627)*sailStates.q + (0.032519)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.267878)*sailStates.alpha + (-0.072601)*sailStates.beta + (-1.168635)*sailStates.p + (9.317904)*sailStates.q + (0.111838)*sailStates.r + (0.000365)*sailStates.de;
	Cm = (-14.886134)*sailStates.alpha + (0.000000)*sailStates.beta + (8.851098)*sailStates.p + (-136.151047)*sailStates.q + (0.370232)*sailStates.r + (-0.068436)*sailStates.de;
	Cn = (0.309146)*sailStates.alpha + (-0.012802)*sailStates.beta + (-0.580828)*sailStates.p + (3.610357)*sailStates.q + (-0.046361)*sailStates.r + (0.000188)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end