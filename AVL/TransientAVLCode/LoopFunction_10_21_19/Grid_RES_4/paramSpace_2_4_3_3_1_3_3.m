function [aeroForces] = paramSpace_2_4_3_3_1_3_3(sailStates,airStates)

	CL = (4.206944)*sailStates.alpha + (-0.107124)*sailStates.beta + (-2.795482)*sailStates.p + (35.994629)*sailStates.q + (0.422026)*sailStates.r + (0.010860)*sailStates.de;
	CD = -0.200870;
	CY = (-0.019011)*sailStates.alpha + (-0.025202)*sailStates.beta + (0.310738)*sailStates.p + (-0.432842)*sailStates.q + (0.020352)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.358807)*sailStates.alpha + (-0.164243)*sailStates.beta + (-1.360379)*sailStates.p + (10.865285)*sailStates.q + (0.477141)*sailStates.r + (0.000562)*sailStates.de;
	Cm = (-14.785350)*sailStates.alpha + (0.460276)*sailStates.beta + (9.762615)*sailStates.p + (-143.531296)*sailStates.q + (-1.436413)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (0.118631)*sailStates.alpha + (-0.006984)*sailStates.beta + (-0.756803)*sailStates.p + (3.982285)*sailStates.q + (-0.012505)*sailStates.r + (0.000182)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end