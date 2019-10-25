function [aeroForces] = paramSpace_3_3_3_2_3_1_2(sailStates,airStates)

	CL = (4.657259)*sailStates.alpha + (0.061071)*sailStates.beta + (-2.547951)*sailStates.p + (33.727154)*sailStates.q + (-0.872227)*sailStates.r + (0.010784)*sailStates.de;
	CD = -0.525890;
	CY = (0.093000)*sailStates.alpha + (-0.025278)*sailStates.beta + (-0.518142)*sailStates.p + (0.769435)*sailStates.q + (0.033988)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.497158)*sailStates.alpha + (0.246909)*sailStates.beta + (-1.188144)*sailStates.p + (9.252754)*sailStates.q + (-0.868751)*sailStates.r + (0.000318)*sailStates.de;
	Cm = (-15.457621)*sailStates.alpha + (-0.232864)*sailStates.beta + (9.067492)*sailStates.p + (-137.556381)*sailStates.q + (2.935760)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (-0.368478)*sailStates.alpha + (-0.013864)*sailStates.beta + (1.212247)*sailStates.p + (-6.341122)*sailStates.q + (-0.017465)*sailStates.r + (-0.000329)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end