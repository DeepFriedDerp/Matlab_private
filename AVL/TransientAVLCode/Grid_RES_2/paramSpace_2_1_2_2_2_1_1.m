function [aeroForces] = paramSpace_2_1_2_2_2_1_1(sailStates,airStates)

	CL = (6.025305)*sailStates.alpha + (-2.049382)*sailStates.beta + (-3.711493)*sailStates.p + (51.108036)*sailStates.q + (2.373022)*sailStates.r + (0.012779)*sailStates.de;
	CD = -6.183640;
	CY = (1.984747)*sailStates.alpha + (-0.133185)*sailStates.beta + (0.377798)*sailStates.p + (15.280751)*sailStates.q + (-0.042162)*sailStates.r + (0.003236)*sailStates.de;

	Cl = (-5.274548)*sailStates.alpha + (-1.095353)*sailStates.beta + (-1.886479)*sailStates.p + (16.410431)*sailStates.q + (2.582700)*sailStates.r + (0.001635)*sailStates.de;
	Cm = (3.945526)*sailStates.alpha + (9.153412)*sailStates.beta + (11.545145)*sailStates.p + (-165.082626)*sailStates.q + (-8.361126)*sailStates.r + (-0.068305)*sailStates.de;
	Cn = (-2.293266)*sailStates.alpha + (0.226036)*sailStates.beta + (-1.031362)*sailStates.p + (-8.118110)*sailStates.q + (-0.190135)*sailStates.r + (-0.004216)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end