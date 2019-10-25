function [aeroForces] = paramSpace_3_1_2_3_3_1_3(sailStates,airStates)

	CL = (4.206944)*sailStates.alpha + (-0.107124)*sailStates.beta + (-2.795483)*sailStates.p + (35.994629)*sailStates.q + (-0.422026)*sailStates.r + (0.010860)*sailStates.de;
	CD = -0.200870;
	CY = (0.019011)*sailStates.alpha + (-0.024370)*sailStates.beta + (-0.310738)*sailStates.p + (0.432842)*sailStates.q + (0.020352)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.499807)*sailStates.alpha + (0.110307)*sailStates.beta + (-1.458077)*sailStates.p + (12.073844)*sailStates.q + (-0.470780)*sailStates.r + (0.000822)*sailStates.de;
	Cm = (-14.785349)*sailStates.alpha + (0.460276)*sailStates.beta + (9.762616)*sailStates.p + (-143.531296)*sailStates.q + (1.436412)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (-0.091725)*sailStates.alpha + (-0.011011)*sailStates.beta + (0.763206)*sailStates.p + (-4.061499)*sailStates.q + (-0.012922)*sailStates.r + (-0.000182)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end