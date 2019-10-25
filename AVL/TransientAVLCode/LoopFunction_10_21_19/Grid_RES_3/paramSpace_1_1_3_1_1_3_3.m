function [aeroForces] = paramSpace_1_1_3_1_1_3_3(sailStates,airStates)

	CL = (6.381923)*sailStates.alpha + (0.341987)*sailStates.beta + (-3.238864)*sailStates.p + (34.882130)*sailStates.q + (1.507475)*sailStates.r + (0.009760)*sailStates.de;
	CD = -2.575880;
	CY = (0.277940)*sailStates.alpha + (-0.022373)*sailStates.beta + (1.031595)*sailStates.p + (-1.081941)*sailStates.q + (0.181795)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (2.574445)*sailStates.alpha + (-0.389368)*sailStates.beta + (-1.893919)*sailStates.p + (15.137366)*sailStates.q + (1.613078)*sailStates.r + (0.001699)*sailStates.de;
	Cm = (-16.321367)*sailStates.alpha + (-1.410146)*sailStates.beta + (12.893205)*sailStates.p + (-160.704926)*sailStates.q + (-4.947138)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (-0.807710)*sailStates.alpha + (-0.099067)*sailStates.beta + (-2.603281)*sailStates.p + (13.710689)*sailStates.q + (-0.115890)*sailStates.r + (0.000526)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end