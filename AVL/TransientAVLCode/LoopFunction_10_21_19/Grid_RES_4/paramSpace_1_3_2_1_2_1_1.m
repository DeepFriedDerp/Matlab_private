function [aeroForces] = paramSpace_1_3_2_1_2_1_1(sailStates,airStates)

	CL = (6.250817)*sailStates.alpha + (0.231215)*sailStates.beta + (-1.797662)*sailStates.p + (35.973511)*sailStates.q + (-2.899250)*sailStates.r + (0.011757)*sailStates.de;
	CD = -2.353080;
	CY = (0.341731)*sailStates.alpha + (-0.025703)*sailStates.beta + (-1.155600)*sailStates.p + (-0.662190)*sailStates.q + (-0.229839)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (1.297314)*sailStates.alpha + (0.662771)*sailStates.beta + (-0.501410)*sailStates.p + (5.066662)*sailStates.q + (-2.493359)*sailStates.r + (-0.000819)*sailStates.de;
	Cm = (-9.126979)*sailStates.alpha + (-0.884075)*sailStates.beta + (3.942795)*sailStates.p + (-110.966957)*sailStates.q + (9.597299)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (-2.043007)*sailStates.alpha + (0.117217)*sailStates.beta + (2.590059)*sailStates.p + (-11.081027)*sailStates.q + (0.038979)*sailStates.r + (0.000020)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end