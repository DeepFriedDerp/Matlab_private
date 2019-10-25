function [aeroForces] = paramSpace_1_2_1_3_1_3_2(sailStates,airStates)

	CL = (3.998228)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.470237)*sailStates.p + (33.155025)*sailStates.q + (-0.106176)*sailStates.r + (0.010234)*sailStates.de;
	CD = -0.093810;
	CY = (-0.058757)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.164946)*sailStates.p + (-0.491627)*sailStates.q + (0.029131)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.262832)*sailStates.alpha + (-0.062866)*sailStates.beta + (-1.168220)*sailStates.p + (9.320558)*sailStates.q + (0.080351)*sailStates.r + (0.000365)*sailStates.de;
	Cm = (-14.641348)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.839447)*sailStates.p + (-136.151047)*sailStates.q + (0.436305)*sailStates.r + (-0.068436)*sailStates.de;
	Cn = (0.310147)*sailStates.alpha + (-0.011085)*sailStates.beta + (-0.551578)*sailStates.p + (3.595309)*sailStates.q + (-0.047027)*sailStates.r + (0.000201)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end