function [aeroForces] = paramSpace_4_1_4_3_2_3_3(sailStates,airStates)

	CL = (4.036293)*sailStates.alpha + (0.402555)*sailStates.beta + (-2.760709)*sailStates.p + (39.552441)*sailStates.q + (1.754299)*sailStates.r + (0.010928)*sailStates.de;
	CD = -0.173340;
	CY = (0.038358)*sailStates.alpha + (-0.025467)*sailStates.beta + (0.575630)*sailStates.p + (-0.194782)*sailStates.q + (-0.114521)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.425595)*sailStates.alpha + (-0.158257)*sailStates.beta + (-1.422424)*sailStates.p + (13.025323)*sailStates.q + (1.412768)*sailStates.r + (0.000786)*sailStates.de;
	Cm = (-12.220634)*sailStates.alpha + (-1.566976)*sailStates.beta + (8.471231)*sailStates.p + (-140.845245)*sailStates.q + (-5.874563)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (-0.317737)*sailStates.alpha + (0.054243)*sailStates.beta + (-1.042577)*sailStates.p + (3.716817)*sailStates.q + (-0.017627)*sailStates.r + (0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end