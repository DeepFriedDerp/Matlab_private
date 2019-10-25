function [aeroForces] = paramSpace_1_2_2_3_3_2_3(sailStates,airStates)

	CL = (3.889974)*sailStates.alpha + (-0.082708)*sailStates.beta + (-2.715996)*sailStates.p + (37.524017)*sailStates.q + (-1.217030)*sailStates.r + (0.010714)*sailStates.de;
	CD = 0.060310;
	CY = (0.050983)*sailStates.alpha + (-0.025728)*sailStates.beta + (-0.337697)*sailStates.p + (0.684401)*sailStates.q + (-0.067197)*sailStates.r + (0.000146)*sailStates.de;

	Cl = (1.374727)*sailStates.alpha + (0.113930)*sailStates.beta + (-1.375445)*sailStates.p + (12.113613)*sailStates.q + (-0.877801)*sailStates.r + (0.000675)*sailStates.de;
	Cm = (-13.524407)*sailStates.alpha + (0.304613)*sailStates.beta + (8.808305)*sailStates.p + (-141.172913)*sailStates.q + (4.079725)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (0.177992)*sailStates.alpha + (0.027678)*sailStates.beta + (0.504061)*sailStates.p + (-1.812005)*sailStates.q + (-0.019912)*sailStates.r + (-0.000232)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end