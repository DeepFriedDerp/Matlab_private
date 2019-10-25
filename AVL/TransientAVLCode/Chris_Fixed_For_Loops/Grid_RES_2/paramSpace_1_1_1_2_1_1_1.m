function [aeroForces] = paramSpace_1_1_1_2_1_1_1(sailStates,airStates)

	CL = (3.872022)*sailStates.alpha + (0.215238)*sailStates.beta + (-4.135346)*sailStates.p + (44.556660)*sailStates.q + (0.663625)*sailStates.r + (0.010653)*sailStates.de;
	CD = -1.332490;
	CY = (0.567331)*sailStates.alpha + (-0.028759)*sailStates.beta + (0.499815)*sailStates.p + (1.698311)*sailStates.q + (0.065682)*sailStates.r + (0.000372)*sailStates.de;

	Cl = (1.146383)*sailStates.alpha + (-0.288653)*sailStates.beta + (-2.611801)*sailStates.p + (22.536135)*sailStates.q + (0.836991)*sailStates.r + (0.002785)*sailStates.de;
	Cm = (-10.436703)*sailStates.alpha + (-0.864068)*sailStates.beta + (14.902019)*sailStates.p + (-182.680328)*sailStates.q + (-2.192310)*sailStates.r + (-0.073678)*sailStates.de;
	Cn = (-1.584620)*sailStates.alpha + (-0.048036)*sailStates.beta + (-1.517390)*sailStates.p + (7.094018)*sailStates.q + (-0.044200)*sailStates.r + (-0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end