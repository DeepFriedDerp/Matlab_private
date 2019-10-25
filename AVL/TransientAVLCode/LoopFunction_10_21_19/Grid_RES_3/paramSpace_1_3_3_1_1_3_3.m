function [aeroForces] = paramSpace_1_3_3_1_1_3_3(sailStates,airStates)

	CL = (6.381923)*sailStates.alpha + (-0.341987)*sailStates.beta + (-3.238864)*sailStates.p + (34.882126)*sailStates.q + (1.507475)*sailStates.r + (0.009760)*sailStates.de;
	CD = -2.575880;
	CY = (0.277940)*sailStates.alpha + (-0.027289)*sailStates.beta + (1.031595)*sailStates.p + (-1.081941)*sailStates.q + (0.181795)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (2.458689)*sailStates.alpha + (-0.551912)*sailStates.beta + (-1.809266)*sailStates.p + (14.076494)*sailStates.q + (1.627903)*sailStates.r + (0.001467)*sailStates.de;
	Cm = (-16.321367)*sailStates.alpha + (1.410147)*sailStates.beta + (12.893206)*sailStates.p + (-160.704956)*sailStates.q + (-4.947140)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (-0.714970)*sailStates.alpha + (-0.066906)*sailStates.beta + (-2.588354)*sailStates.p + (13.523629)*sailStates.q + (-0.113276)*sailStates.r + (0.000526)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end