function [aeroForces] = paramSpace_3_3_3_3_3_1_3(sailStates,airStates)

	CL = (4.245139)*sailStates.alpha + (0.028406)*sailStates.beta + (-2.814748)*sailStates.p + (36.277363)*sailStates.q + (-0.410373)*sailStates.r + (0.010997)*sailStates.de;
	CD = -0.187750;
	CY = (0.021103)*sailStates.alpha + (-0.025146)*sailStates.beta + (-0.295173)*sailStates.p + (0.432841)*sailStates.q + (0.019362)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.421911)*sailStates.alpha + (0.138669)*sailStates.beta + (-1.401968)*sailStates.p + (11.342857)*sailStates.q + (-0.449185)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-14.938908)*sailStates.alpha + (-0.107216)*sailStates.beta + (9.825778)*sailStates.p + (-144.575439)*sailStates.q + (1.374742)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (-0.117810)*sailStates.alpha + (-0.007774)*sailStates.beta + (0.736019)*sailStates.p + (-3.995415)*sailStates.q + (-0.012820)*sailStates.r + (-0.000195)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end