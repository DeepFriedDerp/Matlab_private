function [aeroForces] = paramSpace_1_3_3_3_1_3_3(sailStates,airStates)

	CL = (4.020106)*sailStates.alpha + (-0.003333)*sailStates.beta + (-2.707990)*sailStates.p + (34.931072)*sailStates.q + (-0.166991)*sailStates.r + (0.010427)*sailStates.de;
	CD = -0.135750;
	CY = (-0.018239)*sailStates.alpha + (-0.025554)*sailStates.beta + (0.177536)*sailStates.p + (-0.318253)*sailStates.q + (0.031274)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.277951)*sailStates.alpha + (-0.065670)*sailStates.beta + (-1.326183)*sailStates.p + (10.697578)*sailStates.q + (0.081362)*sailStates.r + (0.000580)*sailStates.de;
	Cm = (-14.735580)*sailStates.alpha + (0.111929)*sailStates.beta + (9.630427)*sailStates.p + (-142.287766)*sailStates.q + (0.580908)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.218532)*sailStates.alpha + (-0.007293)*sailStates.beta + (-0.583406)*sailStates.p + (3.490210)*sailStates.q + (-0.047505)*sailStates.r + (0.000121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end