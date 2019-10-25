function [aeroForces] = paramSpace_4_2_3_2_2_2_1(sailStates,airStates)

	CL = (3.805067)*sailStates.alpha + (0.065037)*sailStates.beta + (-2.092415)*sailStates.p + (32.003586)*sailStates.q + (0.834445)*sailStates.r + (0.010408)*sailStates.de;
	CD = 0.067320;
	CY = (0.006714)*sailStates.alpha + (-0.024646)*sailStates.beta + (0.181027)*sailStates.p + (0.301044)*sailStates.q + (-0.035998)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.004774)*sailStates.alpha + (-0.085750)*sailStates.beta + (-0.860669)*sailStates.p + (7.043625)*sailStates.q + (0.564442)*sailStates.r + (-0.000134)*sailStates.de;
	Cm = (-13.437672)*sailStates.alpha + (-0.245506)*sailStates.beta + (6.915846)*sailStates.p + (-123.990753)*sailStates.q + (-2.818332)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (0.006921)*sailStates.alpha + (0.019470)*sailStates.beta + (-0.279578)*sailStates.p + (0.568163)*sailStates.q + (-0.022653)*sailStates.r + (-0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end