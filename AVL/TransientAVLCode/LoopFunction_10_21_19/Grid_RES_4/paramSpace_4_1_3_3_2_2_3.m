function [aeroForces] = paramSpace_4_1_3_3_2_2_3(sailStates,airStates)

	CL = (3.757742)*sailStates.alpha + (0.228420)*sailStates.beta + (-2.711567)*sailStates.p + (37.174702)*sailStates.q + (1.084168)*sailStates.r + (0.010555)*sailStates.de;
	CD = 0.079330;
	CY = (0.004137)*sailStates.alpha + (-0.025426)*sailStates.beta + (0.258157)*sailStates.p + (-0.194783)*sailStates.q + (-0.051358)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.334506)*sailStates.alpha + (-0.045086)*sailStates.beta + (-1.407004)*sailStates.p + (12.408151)*sailStates.q + (0.775941)*sailStates.r + (0.000786)*sailStates.de;
	Cm = (-13.259347)*sailStates.alpha + (-0.847974)*sailStates.beta + (8.913791)*sailStates.p + (-140.845245)*sailStates.q + (-3.649669)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (-0.249191)*sailStates.alpha + (0.020035)*sailStates.beta + (-0.331249)*sailStates.p + (0.614086)*sailStates.q + (-0.032802)*sailStates.r + (0.000080)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end