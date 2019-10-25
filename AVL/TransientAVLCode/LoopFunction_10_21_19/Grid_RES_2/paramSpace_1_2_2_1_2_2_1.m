function [aeroForces] = paramSpace_1_2_2_1_2_2_1(sailStates,airStates)

	CL = (4.286021)*sailStates.alpha + (-0.110729)*sailStates.beta + (-1.938154)*sailStates.p + (27.845251)*sailStates.q + (0.515750)*sailStates.r + (0.010043)*sailStates.de;
	CD = -0.521430;
	CY = (0.009269)*sailStates.alpha + (-0.023989)*sailStates.beta + (0.351887)*sailStates.p + (0.715006)*sailStates.q + (0.046377)*sailStates.r + (0.000151)*sailStates.de;

	Cl = (0.808727)*sailStates.alpha + (-0.229357)*sailStates.beta + (-0.710761)*sailStates.p + (4.752212)*sailStates.q + (0.677616)*sailStates.r + (-0.000447)*sailStates.de;
	Cm = (-14.912363)*sailStates.alpha + (0.496073)*sailStates.beta + (7.203208)*sailStates.p + (-121.082581)*sailStates.q + (-1.740218)*sailStates.r + (-0.067358)*sailStates.de;
	Cn = (0.504731)*sailStates.alpha + (-0.025331)*sailStates.beta + (-0.878415)*sailStates.p + (3.515129)*sailStates.q + (-0.014355)*sailStates.r + (-0.000140)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end