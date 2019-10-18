function [aeroForces] = paramSpace_1_2_2_1_2_2_1(sailStates,airStates)

	CL = (8.333606)*sailStates.alpha + (-0.611901)*sailStates.beta + (-2.575128)*sailStates.p + (28.951345)*sailStates.q + (0.484541)*sailStates.r + (0.008640)*sailStates.de;
	CD = -5.784740;
	CY = (2.017319)*sailStates.alpha + (-0.003579)*sailStates.beta + (-0.181975)*sailStates.p + (16.444279)*sailStates.q + (-0.019299)*sailStates.r + (0.003503)*sailStates.de;

	Cl = (-2.625881)*sailStates.alpha + (-0.595865)*sailStates.beta + (-1.386861)*sailStates.p + (11.378144)*sailStates.q + (1.180844)*sailStates.r + (0.000352)*sailStates.de;
	Cm = (-11.976229)*sailStates.alpha + (2.944922)*sailStates.beta + (9.395545)*sailStates.p + (-138.355560)*sailStates.q + (-1.913563)*sailStates.r + (-0.068429)*sailStates.de;
	Cn = (-2.176196)*sailStates.alpha + (-0.084108)*sailStates.beta + (-0.223638)*sailStates.p + (-10.912693)*sailStates.q + (0.140499)*sailStates.r + (-0.004658)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end