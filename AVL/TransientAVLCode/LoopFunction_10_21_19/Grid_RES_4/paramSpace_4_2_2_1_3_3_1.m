function [aeroForces] = paramSpace_4_2_2_1_3_3_1(sailStates,airStates)

	CL = (5.338152)*sailStates.alpha + (0.204385)*sailStates.beta + (-1.847305)*sailStates.p + (35.651440)*sailStates.q + (2.465678)*sailStates.r + (0.011848)*sailStates.de;
	CD = -1.800830;
	CY = (-0.003532)*sailStates.alpha + (-0.022582)*sailStates.beta + (0.876829)*sailStates.p + (2.326709)*sailStates.q + (-0.174496)*sailStates.r + (0.000486)*sailStates.de;

	Cl = (0.574727)*sailStates.alpha + (-0.479829)*sailStates.beta + (-0.563786)*sailStates.p + (5.374639)*sailStates.q + (2.127125)*sailStates.r + (-0.000626)*sailStates.de;
	Cm = (-8.646984)*sailStates.alpha + (-0.775233)*sailStates.beta + (4.520907)*sailStates.p + (-113.341965)*sailStates.q + (-8.180377)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (1.358811)*sailStates.alpha + (0.105825)*sailStates.beta + (-2.004268)*sailStates.p + (7.203402)*sailStates.q + (-0.002007)*sailStates.r + (-0.000517)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end