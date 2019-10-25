function [aeroForces] = paramSpace_1_3_2_1_1_2_3(sailStates,airStates)

	CL = (3.413141)*sailStates.alpha + (0.146622)*sailStates.beta + (-3.389657)*sailStates.p + (42.000999)*sailStates.q + (-0.750696)*sailStates.r + (0.011069)*sailStates.de;
	CD = 0.070730;
	CY = (-0.141954)*sailStates.alpha + (-0.027557)*sailStates.beta + (-0.024342)*sailStates.p + (-1.081941)*sailStates.q + (-0.004292)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (1.180152)*sailStates.alpha + (0.104617)*sailStates.beta + (-1.856805)*sailStates.p + (15.943145)*sailStates.q + (-0.490770)*sailStates.r + (0.001467)*sailStates.de;
	Cm = (-12.497957)*sailStates.alpha + (-0.534816)*sailStates.beta + (11.568804)*sailStates.p + (-160.704956)*sailStates.q + (2.563915)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (0.386528)*sailStates.alpha + (0.018379)*sailStates.beta + (-0.208486)*sailStates.p + (2.937335)*sailStates.q + (-0.065567)*sailStates.r + (0.000313)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end