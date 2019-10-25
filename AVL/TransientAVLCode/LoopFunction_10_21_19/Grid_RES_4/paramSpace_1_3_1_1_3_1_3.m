function [aeroForces] = paramSpace_1_3_1_1_3_1_3(sailStates,airStates)

	CL = (7.549983)*sailStates.alpha + (0.289832)*sailStates.beta + (-3.451802)*sailStates.p + (50.826908)*sailStates.q + (-4.022262)*sailStates.r + (0.012527)*sailStates.de;
	CD = -3.131910;
	CY = (-0.258151)*sailStates.alpha + (-0.022259)*sailStates.beta + (-1.645391)*sailStates.p + (2.326703)*sailStates.q + (-0.327539)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (3.227027)*sailStates.alpha + (0.820716)*sailStates.beta + (-1.869430)*sailStates.p + (18.629618)*sailStates.q + (-3.429463)*sailStates.r + (0.001319)*sailStates.de;
	Cm = (-11.791901)*sailStates.alpha + (-1.100963)*sailStates.beta + (8.864258)*sailStates.p + (-156.352325)*sailStates.q + (13.317852)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (1.924680)*sailStates.alpha + (0.140433)*sailStates.beta + (3.331384)*sailStates.p + (-15.226052)*sailStates.q + (0.054450)*sailStates.r + (-0.000962)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end