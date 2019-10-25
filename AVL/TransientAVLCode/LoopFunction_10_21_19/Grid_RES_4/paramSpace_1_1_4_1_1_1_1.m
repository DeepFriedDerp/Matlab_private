function [aeroForces] = paramSpace_1_1_4_1_1_1_1(sailStates,airStates)

	CL = (5.286242)*sailStates.alpha + (-0.588902)*sailStates.beta + (-1.828977)*sailStates.p + (35.335526)*sailStates.q + (-2.450660)*sailStates.r + (0.011762)*sailStates.de;
	CD = -1.779220;
	CY = (-0.000266)*sailStates.alpha + (-0.018106)*sailStates.beta + (-0.861018)*sailStates.p + (-2.326707)*sailStates.q + (-0.171517)*sailStates.r + (-0.000482)*sailStates.de;

	Cl = (0.614846)*sailStates.alpha + (0.366271)*sailStates.beta + (-0.586636)*sailStates.p + (5.692463)*sailStates.q + (-2.105633)*sailStates.r + (-0.000540)*sailStates.de;
	Cm = (-8.666203)*sailStates.alpha + (2.185129)*sailStates.beta + (4.466815)*sailStates.p + (-112.315697)*sailStates.q + (8.114442)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (-1.285461)*sailStates.alpha + (0.104308)*sailStates.beta + (1.974428)*sailStates.p + (-7.108319)*sailStates.q + (-0.002694)*sailStates.r + (0.000509)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end