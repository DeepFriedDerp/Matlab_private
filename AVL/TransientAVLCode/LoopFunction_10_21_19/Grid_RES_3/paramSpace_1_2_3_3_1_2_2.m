function [aeroForces] = paramSpace_1_2_3_3_1_2_2(sailStates,airStates)

	CL = (3.931681)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.516552)*sailStates.p + (35.112274)*sailStates.q + (-0.742586)*sailStates.r + (0.010858)*sailStates.de;
	CD = 0.057400;
	CY = (-0.061649)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.100394)*sailStates.p + (-0.491627)*sailStates.q + (-0.017749)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.190984)*sailStates.alpha + (0.069812)*sailStates.beta + (-1.183176)*sailStates.p + (9.862635)*sailStates.q + (-0.469247)*sailStates.r + (0.000365)*sailStates.de;
	Cm = (-14.217699)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.477860)*sailStates.p + (-136.151047)*sailStates.q + (2.486970)*sailStates.r + (-0.068436)*sailStates.de;
	Cn = (0.187244)*sailStates.alpha + (0.012310)*sailStates.beta + (0.080183)*sailStates.p + (0.521035)*sailStates.q + (-0.031978)*sailStates.r + (0.000116)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end