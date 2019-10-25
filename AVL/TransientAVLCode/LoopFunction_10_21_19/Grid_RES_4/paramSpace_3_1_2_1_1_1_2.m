function [aeroForces] = paramSpace_3_1_2_1_1_1_2(sailStates,airStates)

	CL = (5.403979)*sailStates.alpha + (-0.398241)*sailStates.beta + (-2.472220)*sailStates.p + (32.128963)*sailStates.q + (-1.453006)*sailStates.r + (0.010354)*sailStates.de;
	CD = -1.722110;
	CY = (-0.200974)*sailStates.alpha + (-0.026414)*sailStates.beta + (-0.708578)*sailStates.p + (-1.693500)*sailStates.q + (0.046502)*sailStates.r + (-0.000362)*sailStates.de;

	Cl = (1.224695)*sailStates.alpha + (0.324636)*sailStates.beta + (-1.218804)*sailStates.p + (9.643521)*sailStates.q + (-1.499421)*sailStates.r + (0.000430)*sailStates.de;
	Cm = (-14.402114)*sailStates.alpha + (1.640717)*sailStates.beta + (8.990870)*sailStates.p + (-135.354233)*sailStates.q + (4.958356)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (-0.141464)*sailStates.alpha + (-0.029042)*sailStates.beta + (1.708558)*sailStates.p + (-6.724022)*sailStates.q + (-0.008624)*sailStates.r + (0.000343)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end