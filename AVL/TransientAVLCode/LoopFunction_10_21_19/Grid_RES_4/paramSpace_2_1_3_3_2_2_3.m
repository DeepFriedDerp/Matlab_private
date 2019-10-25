function [aeroForces] = paramSpace_2_1_3_3_2_2_3(sailStates,airStates)

	CL = (3.968358)*sailStates.alpha + (-0.063020)*sailStates.beta + (-2.807495)*sailStates.p + (36.803017)*sailStates.q + (-0.360596)*sailStates.r + (0.011016)*sailStates.de;
	CD = 0.029250;
	CY = (-0.000329)*sailStates.alpha + (-0.024849)*sailStates.beta + (-0.078130)*sailStates.p + (0.065300)*sailStates.q + (-0.005119)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.397122)*sailStates.alpha + (0.011433)*sailStates.beta + (-1.460343)*sailStates.p + (12.288717)*sailStates.q + (-0.246022)*sailStates.r + (0.000811)*sailStates.de;
	Cm = (-14.372305)*sailStates.alpha + (0.198174)*sailStates.beta + (9.560460)*sailStates.p + (-143.297119)*sailStates.q + (1.209741)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.081223)*sailStates.alpha + (0.001939)*sailStates.beta + (0.094507)*sailStates.p + (-0.202543)*sailStates.q + (-0.003693)*sailStates.r + (-0.000035)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end